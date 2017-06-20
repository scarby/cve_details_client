# CveDetailsClient

## Usage

After checking out the repo run `bundle install`.

You can then run the cvetest client using `bundle exec bin/cve_details_client product dataFile [toEmail] [fromEmail]`

If the dataFile is blank it will check for vulnerabilities from the current day which there may not be any of - create one with content like:

```
  {
    "cve_id": "CVE-2017-3733",
    "update_date": "2017-03-08"
```

After running the CVE details will be updated with the details of the most recently updated found CVE

if e-mail details are omitted output will be printed to STDOut In order to send SMTP is required to be setup locally



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Scarby/cve_details_client.
