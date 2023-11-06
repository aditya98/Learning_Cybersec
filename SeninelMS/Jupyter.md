In short…

- **Notebooks can be artifact storage** – data persistence, repeatability and backtracking allows analysts to collect and store evidence and collateral to improve response the next time a similar event occurs.
- **Notebooks can be interactive** – storing more than just pieces of information, notebooks can process the scripts it stores and produce data results inline to be used to build a more efficient and more intelligent approach to investigations and hunting.
- **Notebooks can be interoperable** – Notebooks enable deeper programmatic abilities to connect to, store, and use external data to be used dynamically.
- **Notebooks can be guides** – through sophisticated data processing, machine learning, and visualization, notebooks guide analysts through every step of an investigation or hunt to expose, mitigate, and remediate threats to the environment.

Difference among each "book" in sentinel their uses and pros and cons for each.

|   |   |   |   |
|---|---|---|---|
||**Playbooks**|**Workbooks**|**Notebooks**|
|**Roles**|•       SOC engineers<br><br>•       Analysts of all tiers|•       SOC engineers<br><br>•       Analysts of all tiers<br><br>•       SOC managers|•       Threat hunters/Tier 2-3 analysts<br><br>•       Incident investigators<br><br>•       Cyber data scientists<br><br>•       Security researchers|
|**Uses**|Automation of simpler, repeatable tasks:<br><br>- Ingestion – bring in external data<br>- Enrichment (TI, GeoIP lookups, etc.)<br>- Investigation<br>- Remediation|- Visualization|- Querying Microsoft Sentinel & external data <br>- Enrichment (TI, GeoIP, WhoIs lookups, etc.)<br>- Investigation<br>- Visualization<br>- Hunting<br>- Machine Learning & big data analytics|
|**Pros**|- Best for single, repeatable tasks<br>- No coding knowledge required|- Best for high-level view of Sentinel data<br>- No coding knowledge required|- Best for more complex chain of repeatable tasks<br>- Ad-hoc, more procedural control – easy to pivot due to the interactive characteristics and the use of Python, a procedural language<br>- Rich Python libraries for data manipulation & visualization options<br>- Machine Learning & custom analysis<br>- Easy to document & share analysis evidence|
|**Cons**|•       Not suitable for ad-hoc & complex chain of tasks<br><br>•       Not great for documenting & sharing evidence|•   Cannot integrate with external data|•       Higher learning curve - requires coding knowledge *<br><br>•       [Limited automated execution](https://techcommunity.microsoft.com/t5/azure-sentinel/software-defined-monitoring-using-automated-notebooks-and-azure/ba-p/2587775) (automation capabilities should be improved in the near future)|


It provides additional capability to help augment areas where Azure Sentinel may not scale as well.

Many pre-built notebooks rely on a Python library called _MSTICPy_

MSTICPy (_Microsoft Threat Intelligence Python Security Tools_) is a Python library that addresses three primary requirements for security investigators and hunters:  acquiring and enriching data, analyzing data, and visualizing data.

MSTICpy provides deeper functionality in the following specific areas: 

- Querying log data from multiple sources at once including Azure Sentinel and external sources like data lake, blob storage, third party providers, *et al* 
- Enriching the data with Threat Intelligence, geolocations and Azure resource data 
- Extracting Indicators of Activity (IoA) from logs and unpack encoded data 
- Performing sophisticated analysis such as anomalous session detection and time series decomposition 
- Visualizing data using interactive timelines, process trees and multi-dimensional Morph Charts 
- Includes time-saving notebook tools such as widgets to set query time boundaries, select and display items from lists, and configure the notebook environment

>Installation/ Working first step is to create your own AML workspace. It can take 2-5 minutes and then we clone our first notebook {Do not rush into cloning despite the option being available directly}
>The Notebook gets cloned in your personal My template repository. First time here we might not have compute shown [so we click on compute icon or simply + icon to add compute]
>This is a gift that keeps on giving. This compute thingy and whole thing is based on linux server. We need to have our kernel update and I know how for now. Follow the video

The notebooks are mostly one of three types:

- **Exploration** notebooks. These are meant to be used as they are or with your own customizations to explore specific hunting and investigation scenarios. Examples of this type include the Entity explorer series. (“Entity” refers to items such as hosts, IP addresses, accounts, URLs, etc.)
- **Simple How-To** notebooks like the Get Started notebook.
- **Sample** notebooks. These are longer and are meant to be instructional examples following a real or simulated hunt or investigation.

Types of notebooks can be found at : [Microsoft Sentinel Notebooks Ninja Part 3: Overview of the Pre-built Notebooks - the Grand List - Microsoft Community Hub](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/microsoft-sentinel-notebooks-ninja-part-3-overview-of-the-pre/ba-p/2768838)

Just in case, I have to raise a ticket for someone to help me create a new instance [Tutorial: Create workspace resources - Azure Machine Learning | Microsoft Learn](https://learn.microsoft.com/en-us/azure/machine-learning/quickstart-create-resources?view=azureml-api-2)

Need to understand and discuss this : [Microsoft Sentinel service limits | Microsoft Learn](https://learn.microsoft.com/en-us/azure/sentinel/sentinel-service-limits)

**msticpy** is a library for InfoSec investigation and hunting in Jupyter Notebooks. It includes functionality to:

- query log data from multiple sources
- enrich the data with Threat Intelligence, geolocations and Azure resource data
- extract Indicators of Activity (IoA) from logs and unpack encoded data
- perform sophisticated analysis such as anomalous session detection and time series decomposition
- visualize data using interactive timelines, process trees and multi-dimensional Morph Charts

