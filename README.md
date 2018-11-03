address-filter
==============

Extract IPv4 & IPv6 addresses from a token stream.  Uses inet_pton to
identify addresses and inet_ntop to format output.  Non-address tokens are
skipped.
