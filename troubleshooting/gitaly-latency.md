# Gitaly latency is too high

## First and foremost

*Don't Panic*

## Note

This runbook will be deprecated in favor of the [gitaly pprof runbook](https://gitlab.com/gitlab-org/gitaly/issues/776) once `pprof` is available in production.

## Symptoms

* Alert on PagerDuty _Gitaly latency on <hostname> has been over 1m during the last 5m_

## 1. Check the triage dashboard to assess the impact

- Visit the **[Triage Dashboard](https://dashboards.gitlab.net/dashboard/db/triage-overview)**.
- Check the **Gitaly p95 latency** graph and identify the offending server or servers.
- Check if there has been any impact on the **p95 Latency per Type** graph
  - Check the `web` latency to assess wether we are impacting the site performance and users.

## 2. Evaluate impact

- If it is late in the day and you cannot engage anyone from the Gitaly team, you might want to restart the `gitaly` process.
  - Log into the affected NFS server.
  - Issue a `sudo kill -6 <GITALY_SERVER_PID>` to dump goroutines info to logs.
  - If the command above didn't restart the process, then issue `sudo gitlab-ctl restart gitaly`.
  - Extract the dump info from the logs for further inspections or inform one of the Gitaly engineers.
