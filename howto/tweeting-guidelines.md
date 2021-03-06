# Tweeting Guidelines

## General Guidelines

We should always be tweeting from `@gitlabstatus` in an informative but
reassuring way. We don't tweet directly from Twitter, but via `@marvin`,
a [Cog][] app on Slack. See [How to tweet](#how-to-tweet) for the commands
we're using.

Avoid using ambiguous messages, but if we don't know what is going on yet just state that we are investigating.
If you are tweeting about a problem with the Container Registry service, avoid using the trademarked name "Docker" as it is not ours to use. Our service should always
be referred to as the "GitLab container registry".

When we have issues with any production operation we should always tweet opening and closing the incident:

- As soon as we realize that there is an incident going on.
- Tweet frequently: when we have findings that are relevant, or roughly every 10 minutes if we are still investigating.
- Closing with the resolution and a brief explanation of the root cause.
- Then adding a link to the post-mortem issue in infrastructure.

Closing tweets should be as detailed as possible, for example: 'we have a failing database migration of a column name'
instead of 'there is a problem with the database'

[Cog]: https://gitlab.com/gitlab-com/runbooks/blob/master/howto/manage-cog.md

## How to tweet

The one who commands `@marvin` on Slack should get a Cog user. Then we send
a message begins with `!tweet` on **#production** channel in order to tell
`@marvin` to tweet, like:

    !tweet "We will be deploying GitLab EE 9.1.2 shortly, no downtime is expected"

We could also use `!broadcast` to broadcast on GitLab.com, like:

    !broadcast "We will be deploying GitLab EE 9.1.2 shortly, no downtime is expected"

There are some options which could be used along with commands. To see how to
use them, check with:

    !help tweet
    !help broadcast

## Canned messages to avoid thinking

### General "we are investigating an issue"

> We're investigating an issue with GitLab.com. Thanks for your patience.

> GitLab.com is back up. Thanks for your patience.

### During deployments

> We'll be deploying GitLab [version] shortly. No downtime is expected but you may see intermittent errors during this time.

> We'll be deploying GitLab [version] at [time] UTC. We will be offline for [time] minutes. Thanks for your patience.

> GitLab.com is now running [version]

> We expect the migrations for [version] to take only a few minutes, but some users may experience some downtime.

> We are experiencing issues during deploy, we are working on resolving the problem.

> We are experiencing issues during deploy, we are investigating the root cause.

> We are experiencing issues during deploy, we are moving to a downtime deploy because of this.

### We are investigating what's going on

> We are investigating problems with ...

### Database high load

> We are seeing high load in the database, which is causing GitLab.com slowness

> We are still investigating PostgreSQL slowness.

> We are pulling the deploy page to let it cool down forcing a backoff from clients.

> We are still experiencing high load on the database.

> The system metrics appear stable for now. We will continue to monitor PostgreSQL.

### Sidekiq high load

> We are adding more capacity to flush background job queues, apologies for the
> inconvenience.

### Forcing a failover

> In a couple of minutes from now we will failover our Redis instance, this "should" not cause any downtime for GitLab.com

### Hotfixes

> We deployed a hotfix that prevents a common, slow DB query. We are still investigating the cause of the DB outages.
