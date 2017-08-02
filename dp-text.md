So, puppet automatically stores all of this data for you in PuppetDB. In order to get that data out, you use Puppet Query Language, or PQL.

With PQL you specify what kind of data you want — node inventory or resources — and then a filter on that data.

---

Let's talk about node inventory first. Puppet automatically collects facts about all of your nodes. (By "nodes" I mean servers or virtual machines.) Facts include things like the server's certname (basically its hostname), its IP address, and the OS it's running.

---

Puppet stores all of that information in the inventory.

To query it, you specify what you want — inventory — and then a filter. In this case we want nodes with "prod" in their hostname, and that are running Debian.

---

Here are the abbreviated results of that query. You can see that it found a node called `web1-prod`, that it has an IP address, that it has about one and a half gigs of memory free, and that it's running Debian.

Of course, depending on the size of your infrastructure this might return hundreds or thousands of nodes.

---

Let's move on to resources.

Resources are "things" on a server. A package, a file, or something more complex like a Postgres database. Here's some puppet code to define a database.

---

You can query resources just like node inventory. You specify what you want — resources — and then a filter. In this case we want resources of type `postgresql::server::db`.

That's gonna return a *bunch* of useful information. It tells you what nodes it's on, all of its parameters, as well as the file and line number of the resource in your puppet code.

It's super useful for debugging. If I want to make a change to a resource, I can query PuppetDB and find out exactly which nodes will be affected.

---
---

Here's another useful query. The standard practice in puppet is to define a "role" for each node, like "web" or "db". Here's how you get the role of every single node in your infrastructure.

---

What are some other ways to use PuppetDB? How about querying it in your puppet code?

It's great for things like defining what backend servers your load balancer should hit. Or, for setting up monitoring to check on all of your hosts.

We use Icinga2 for monitoring at puppet. Let's look at an example of defining hosts to be monitored.

This just calls the function `puppetdb_query` with a string of PQL, and then iterates over the results using facts about the nodes to define host objects in Icinga.

Now, if you've used puppet you might be used to exported resources. One of the big reasons to use this over exported resources is so that you can make changes in just one place.

For example, changing the host object in Icinga only requires a puppet run on the Icinga master rather than runs on each of the hosts and then the master.

