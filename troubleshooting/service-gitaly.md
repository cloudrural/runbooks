<!-- MARKER: do not edit this section directly. Edit services/service-mappings.yml then run scripts/generate-docs -->
#  Gitaly Service

* **Responsible Team**: [gitaly](https://about.gitlab.com/handbook/engineering/dev-backend/gitaly/)
* **Slack Channel**: [#gitaly](https://gitlab.slack.com/archives/gitaly)
* **General Triage Dashboard**: https://dashboards.gitlab.net/d/WOtyonOiz/general-triage-service?from=now-6h&to=now&var-prometheus_ds=Global&var-environment=gprd&var-type=gitaly&orgId=1
* **Alerts**: https://alerts.gprd.gitlab.net/#/alerts?filter=%7Btype%3D%22gitaly%22%2C%20tier%3D%22stor%22%7D
* **Label**: gitlab-com/gl-infra/production~"Service:Gitaly"
* **Sentry**: https://sentry.gitlab.net/gitlab/gitaly-production
* **Grafana Folder**: https://dashboards.gitlab.net/dashboards/f/SRXyrrSmk

## Logging

* [Gitaly](https://log.gitlab.net/goto/4f0bd7f08b264e7de970bb0cc9530f9d)
* [system](https://log.gitlab.net/goto/7cfb513706cffc0789ad0842674e108a)

## Troubleshooting Pointers

* [gitaly-down.md](gitaly-down.md)
* [gitaly-error-rate.md](gitaly-error-rate.md)
* [gitaly-high-cpu.md](gitaly-high-cpu.md)
* [gitaly-latency.md](gitaly-latency.md)
* [gitaly-pubsub.md](gitaly-pubsub.md)
* [gitaly-rate-limiting.md](gitaly-rate-limiting.md)
* [gitaly-unusual-activity.md](gitaly-unusual-activity.md)
* [gitaly-version-mismatch.md](gitaly-version-mismatch.md)
* [workhorse-git-session-alerts.md](workhorse-git-session-alerts.md)
<!-- END_MARKER -->
