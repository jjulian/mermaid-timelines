# mermaid-timelines
 Generate timeline graphs from csv

## Ad Hoc csv dump
```
$ cat employee_github-state_20201222.csv | sort -t"," -k5 | ./timeline.rb > out.html
```
