# puppetdb_ignite

Slides for 2017 Config Management Camp Portland talk on PuppetDB.

> [!WARNING]
> This was written in 2017 targeting PuppetDB 5, which is no longer supported.
> Some links were updated in 2025 for clarity, but the examples may not work.

The text for the slides in Markdown is in the file called
[slides.md](slides.md). That's the best place to go it you want to copy/paste
any of the code. It is in the [Deckset](https://www.deckset.com) format.

There are two rendered versions of the slides:

* [A PDF of just the slides](slides.pdf)
* [A PDF of the slides and presentation notes](slides-with-notes.pdf)

The slides were originally on a 30 second timer, resulting in a 5 minute
presentation.

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

* [Examples](https://www.puppet.com/docs/puppetdb/latest/api/query/examples-pql)
* [Tutorial](https://www.puppet.com/docs/puppetdb/latest/api/query/tutorial-pql)
* [Reference](https://www.puppet.com/docs/puppetdb/latest/api/query/v4/pql)

## Authors

* Rich Burroughs [@richburroughs.dev](https://bsky.app/profile/richburroughs.dev)
* Daniel Parks [demon.horse](https://demon.horse/)
