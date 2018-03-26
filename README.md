# Generate MuleESB JMX plugin files for Dynatrace SaaS/Managed

The "config" file has MBean domain name and application name (For metric displayname), delimited by a semicolon -

	Mule..agent;agent
	Mule.default;default
	Mule.echo;echo
	Mule.bookstore-admin;bookstore-admin
	Mule.mule-example-bookstore-3.31;bookstore-front

The shell script just loops through these and creates a json plugin file that can be uploaded to Dynatrace SaaS/Managed for each application to be monitored. A future improvement might be to add in upload to the SaaS server as this can be done remotely over REST. 

Metrics gathered for each application are - 

        "attribute": "ProcessedEvents"
        "attribute": "FatalErrors"
        "attribute": "AsyncEventsReceived"
        "attribute": "SyncEventsReceived"
        "attribute": "TotalEventsReceived"
        "attribute": "MaxProcessingTime"
        "attribute": "MinProcessingTime"
        "attribute": "TotalProcessingTime"
        "attribute": "ExecutionErrors"
        "attribute": "AverageProcessingTime"

These are all the key attributes MuleESB provides as of v3.9, more can be added as can graphs, alerts etc... 

The graphs will be under the process group for MuleESB, in "Further Details", no key graphs or metrics are defined in these plugins. There is a graph group per application in this section. The metric names are then available in the "Custom Chart" section, named according to application, such as "Processes - AsyncEventsReceived_agent" for the "agent" application.
