# Production Incidents

Second level escalation or above can only declare a major incident. This means the Production Lead, the Director of Infrastructure, or finally the VP of Engineering.

In the case we find ourselves in such a situation, escalate to these persons via Slack if they are available, phone call, or just by paging in the provided order and explain why this is a major incident.

During a major outage it's critical to manage communications in a reassuring manner to show the customers that we are handling the issue in a timely and effective manner.

For this, we designed this set of guidelines to communicate properly and to provide a transparent view into what's going on to the community, allowing them to help us.

It's worth noting that if the incident is critical or too urgent, delgate a person who will follow this guideline while you work on solving the issue.

## Communication Strategy

* Production:
  * Start a war room on Zoom immediately to have high a bandwidth communication channel, make sure you are on a paid account so the meeting is not time limited.
  * Open a [Google Doc](https://docs.google.com) and make it GitLab editable by clicking on the `Share` icon and selecting _Advanced_, _Change_, then _On - GitGlab_.
      * Publish the document using the _File_, _Publish to web..._ function.
      * Use this document to write the timeline of events as they are known and complete the facts with data as it is found.
      * It's fine to write partial findings or guessing, we just need to validate our assumptions as we go.
      * Redact the names to remove the blame.
      * Tweet a link to this document to make the community aware.
  * Involve the Marketing team by calling @channel in the `#marketing` channel via Slack so they can start working on how to communicate this incident to broader audience while you work on solving the incident.
  * Keep updating the doc with new findings.
  * When the incident is done and we recovered the service, turn the doc into an issue that will be labeled as `outage`. Decide with marketing if in turn this should be a further blog post. In any case open the issue with the timeline to keep a track record in the infrastructure issue tracker.
* Marketing:
  * Make the war room live by default by following this [Zoom guide](https://support.zoom.us/hc/en-us/articles/115000350446-Streaming-a-Webinar-on-YouTube-Live) (for this you will need to have access to the GitLab Youtube account, ask someone from People Ops to grant you so), unless it interferes with solving the incident, or it impacts security or privacy of either a GitLab employee or a customer. Ask the lead that declared the major incident in the war room if any of these circumstances apply.
  * Edit the doc to provide context wherever is needed. Include data on how is this incident impacting customers, and specifically which customers are being impacted. Be really clear on how this is affecting on-premises, GitHost and GitLab.com customers.
  * Handle communications with the community including the devrel team so they can also handle the customers expectations.

## Blameless Post Mortems

Refer to the [infrastructure section](https://about.gitlab.com/handbook/infrastructure/) in the handbook for a description on how to write a good post mortem.