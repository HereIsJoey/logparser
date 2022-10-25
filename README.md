# Sample Log Parsing Utility

### Description

- This script evaluates whether a system utilizes systemd or init and grabs logs accordingly.
- The intended output is a (long) list of processes, a summary of each process' unique messages, and the count of times the message has appeared.

### Reflection

- This script should be considered a proof of concept (POC) and is not fully tested for use in production systems.
- At this point in my life, I am more familar with Bash, which made it a more logical choice for such a minimal POC; however, if this were to be expanded and used in production, I would prefer to write it in Python; this would allow for more sensible string parsing, increased readability, and greater opportunities for feature expansion in the future.
- From my time working in other languages, the use of global variables in this makes me cringe a bit
- The combination of `grep`, `awk`, `sed`, and `cut` is due to my limited knowledge of `awk` and `sed`, both of which I'm sure could pull more weight in this script.  
- Possible features that could be added in the future include:
  - built-in paging
  - filtering options
  - argument-based option setting (which processes are of interested, exclusions to make, etc)
  - colored text for easier skimming
  - scheduling of log parsing
  - automated alerts
  - database integration for longterm reporting
  - summarizing alerts by hour (this would require datetime parsing/casting and assumptions on year)

