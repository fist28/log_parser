# Log Parser
It is simple ruby script for parsing logs. 

# How to use
To execute script you can run command:
```bash
$ ./parser.rb webserver.log
```
Remember about add privileges to execute script `chmod +x parser.rb`
You can find example of input file [here](./webserver.log)

# Result of script
At the result of the script you can find two lists. 
- First list concern webpages with most page views ordered from most pages views to less page views. 
- Second list include of webpages with unique page views also ordered.

Example of result:
```
/home 90 visits
/index 80 visits
...

/about/2 8 unique views
/index 5 unique views
...
``` 