# puppetdb_ignite

Slides for Config Management Camp Portland talk on PuppetDB

The text for the slides in Markdown is in the file called slides.md.
That's the best place to go it you want to copy/paste any of the code.

The PDF of the slides is called slides.pdf.

## Example environment

You can set up an example environment with vagrant. Install vagrant and run:

~~~ sh
gem install r10k
./run-r10k.sh
vagrant up puppet-master
vagrant up web1
~~~

You can access the puppet master with `vagrant ssh puppet-master`.

## PQL documentation

* [Examples](https://docs.puppet.com/puppetdb/5.0/api/query/examples-pql.html)
* [Tutorial](https://docs.puppet.com/puppetdb/5.0/api/query/tutorial-pql.html)
* [Reference](https://docs.puppet.com/puppetdb/5.0/api/query/v4/pql.html)

## Authors

* Rich Burroughs [@richburroughs](https://twitter.com/richburroughs)
* Daniel Parks [@daemonhoarse](https://twitter.com/daemonhoarse)
