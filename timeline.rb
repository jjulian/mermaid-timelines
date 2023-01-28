#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'time'
today = Time.now.strftime '%Y-%m-%d'

puts %(\
<script type="module">
  import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@9/dist/mermaid.esm.min.mjs';
  mermaid.initialize({
    startOnLoad: true,
    theme: 'base' // see custom Ad Hoc themeVariables below
  });
</script>
<pre class="mermaid">
%%{
  init: {
    'theme': 'base',
    'themeVariables': {
      'primaryColor': '#118762',
      'textColor': '#111',
      'secondaryColor': '#31b67b',
      'tertiaryColor': '#cdecdb'
    }
  }
}%%
gantt
    title Ad Hoc Timeline
    axisFormat %Y
    todayMarker off
)

ARGF.each do |line|
  columns = CSV.parse_line(line)
  name = columns[0..1].join(' ')
  id = columns[0..1].join('-').downcase.gsub(/[^a-z-]/, '_')
  start_date = Time.parse(columns[4]).strftime '%Y-%m-%d'
  is_alumni = columns[5] != nil
  end_date = is_alumni ? Time.parse(columns[5]).strftime('%Y-%m-%d') : today
  puts "    #{name} :#{id}, #{start_date}, #{end_date}"
end

puts %(\
</pre>
)
