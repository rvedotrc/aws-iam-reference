# aws-iam-reference

A list of all known IAM actions; and a way of updating that list.

# Why?

Because sometimes it's just handy to have the list of IAM actions, all in one
place.  For example, if you can _almost_ remember the name of the action, but
not quite, this list can be quite a handy reference.

It's also informative to observe the history of the list, as new actions are
added.

I wish AWS provided this information themselves somewhere, in a supported,
machine-readable form.  But if they do provide it, I haven't found it yet.

# Using the list

It's one action per line, plain text format: `all-actions.txt`

For example, to see all CloudWatch Events actions: `grep ^events: all-actions.txt`

# Updating the list

Requires curl, ruby, node, and jq.

Run `make update`; review the results.

The update works by reading JavaScript assets used by the AWS Policy Generator
<https://awspolicygen.s3.amazonaws.com/policygen.html>.  It's very much an
unsupported method though, so the update scripts might need updating from time
to time.

# License

Licensed under the Apache License, Version 2.0.  See the LICENSE file.

