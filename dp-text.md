PuppetDB ignite talk

So, puppet automatically stores all of this data for you in PuppetDB. In order to get that data out, you use Puppet Query Language, or PQL.

With PQL you specify what kind of data you want — say node inventory or resources — and then a filter on that data.

---

Let's talk about node inventory first. Puppet automatically collects a bunch facts about all of your nodes. (By "nodes" I mean servers or virtual machines.)

Little clarification; certname is a puppet thing, but it's generally equivalent to the hostname.

Puppet stores all of that in the inventory.

---

Here's some PQL. We're querying inventory, and we only want nodes that both have "prod" in their hostname, and that are running Debian. As you can see, the syntax is pretty simple.

---

Here are the abbreviated results of that query. You can see that it found a node called `web1-prod`, that it has an IP address, that it has about one and a half gigs of memory free, and so on.

Of course, depending on your query, this could return multiple nodes.

---

Let's move on to resources.

Resources are "things" on a server. A package, a file, or something more complex like a Postgres database. This is what the puppet code to define a Postgres DB looks like.

Of course, you can query resources just like node inventory.

---

Here's an example. We're querying resources, and we only want ones with the type `postgresql::server::db`.

That's gonna return a *bunch* of useful information about each instance of the resource. It tells you what node it's on, all of its parameters, as well as the file and line number where it's defined in your puppet code. Super useful for debugging.

It's also great for ad hoc testing. Let's say I change a resource; I can go to PuppetDB and find out exactly which nodes will be affected by the change.

---
---

Here's another useful query. If you're not familiar with Puppet, the standard practice is to give each node a "role", like "web" or "db". Here's a simple query that returns every node in your infrastructure along with the role assigned to it.

---

Alright. To learn more, head over to docs.puppet.com and look at the PQL examples. There's also a tutorial and a reference, but I think the examples are a better place to start. Unfortunately I didn't put the URL on here… so you gotta Google.

---

I want to take a little detour here and point out that you can query PuppetDB from your Puppet code. It's useful when, say, you want to automatically define backends for your load balancer, or configure monitoring to watch all your hosts.

---

It's pretty simple. You pass some PQL to the function `puppetdb_query`, and it returns an array of objects. You can iterate over that and define resources.

---
---
---

## Conclusion

So that's puppetdb. Please come and ask us questions, or hit us up on twitter: @richburroughs, @daemonhoarse — note that both "daemon" and "hoarse" have "a"s in them.

We also have the repo that defines these slides up on GitHub.



