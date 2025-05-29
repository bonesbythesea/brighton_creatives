brighton creatives
===
# introduction
the covid pandemic, with its lockdowns and closures of public spaces had a complex effect on society. artists and others operating in the --already fickle-- creative industries we heavily impacted but the picture is complicated. by various metrics, the creative industries bounced back rapidly, but the post covid world still bears the marks of the interruption.

here we are focusing on the impact on the creative industries in brighton. our plan to investigate this is to collect available data from official sources

# project structure
```
├── data
│   ├── creatives.duckdb  --> central database for processed data
│   ├── csv               --> raw data files in csv format
│   │   ├── ons           --> raw csv by-region data files from the ons
│   │   └── time_series   --> raw csv time series from the ons 
│   ├── excel             --> raw excel formatted data reports from official sources
│   └── source_urls       --> lists of urls from where data is sourced
├── img                   --> graphical resources, including plots genrated or downloaded from sources
├── notebooks             --> processing, exploratory, and modelling code notebooks
├── notes                 --> various text or pdf documents containing relevant information 
├── readme.md             --> this file
├── sql                   --> transformations, joins and analytics on database tables
└── src                   --> (mostly python) source code for scraping/ingestion/processing/modelling
```

# Research questions 

## Are creative people leaving Brighton? 

Prompted by this article from the Brighton Chamber 
- [discussion at brighton chamber](https://www.brightonchamber.co.uk/blog/the-big-debate-is-brightons-creative-sector-an-undervalued-powerhouse)

- **Q1: What are the greatest barriers for creative people working in Brighton?**
    - Affordable spaces to make/do (e.g., the closure of New England House).
    - Spaces to show/sell
    - Supportive infrastructure (e.g., arts organisations, local funding)
    - Routes to audiences (e.g., tourism board, what's on guides, social media, ticketing sites)
    - Supplementary job opportunities, e.g., both universities have been hit with redundancies, how have creative subjects been impacted? Is there even information available?
    - Are there any factors which may have impacted creative incomes in Brighton?
        - e.g., has AI impacted photographers and visual designers? 

- **Q2: What are the greatest barriers for creative people living in Brighton?**
    - Cost of living versus average income.
        - Related to this, I am interested in finding out if there is a general trend of people leaving Brighton, beyond the usual changes to the student population.
    - Relative costs of rents in Brighton as compared to income
    - Issues with housing stock in more affordable areas. Related to this - just some ideas...
        - Crime in these areas
        - Quality of schools in these areas
        - Quality of doctors surgeries
        - Access to an NHS dentist


# specific notes 

## department for culture, media, and sport
[2016 report](https://assets.publishing.service.gov.uk/media/5a802de7e5274a2e87db850b/DCMS_Statistical_Handbook_-_28_September_2016.pdf)
[source: 1](https://www.thecreativeindustries.co.uk/facts-figures/creative-industries-add-ps124bn-of-value-to-uk), [and 2](https://www.gov.uk/government/statistics/dcms-and-digital-sector-gva-2022-provisional/dcms-sectors-economic-estimates-gross-value-added-2022-provisional)
> The economic contribution of the UK creative industries grew by 6.8 per cent in 2022 to reach £124.6bn, according to official UK government estimates.
> 
> In real terms, this means the economic value of the UK creative industries was 12 per cent bigger in 2022 than before the COVID pandemic and more than 50 per cent larger than its size in 2010.
> 
> Using the government's official economic measure of Gross Value Added (GVA) in chained volume measures, the creative industries grew more than twice as fast in 2022 as the UK economy as a whole. Since 2010, the creative industries have expanded according to this measure by 50.3 per cent, compared to the UK economy's average increase of 21.5 per cent during the same period. Creative industries account for 5.7 per cent of total UK GVA.
> 
> ‘IT, software and computer services’ comprises the largest subsector component of the creative industries by GVA (£53.4bn in 2022). It is more than twice the size of the next largest subsector, ‘Film, TV, video, radio and photography’ which contributed £20.8bn in 2022.
> 
> The largest contributions to the increase in creative Industries GVA from 2021 to 2022 were the ‘IT, software and computer services’ subsector, the ‘Publishing’ subsector and the ‘Film, TV, video, radio and photography’ subsector, which grew by 7.3 per cent, 10.1 per cent and 5.4 per cent respectively. All segments of the creative industries grew their GVA from 2021 to 2022, apart from the crafts subsector, which fell by 6.8 per cent.

## non-economic impact of the arts
- [example impact on baby names] (https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/livebirths/articles/fromstarwarstothekardashianstheculturalinfluencesthatcouldbedrivingbabynametrends/2022-10-05)


# sources

- [discussion at brighton chamber](https://www.brightonchamber.co.uk/blog/the-big-debate-is-brightons-creative-sector-an-undervalued-powerhouse)
- [ons: methodology](https://oflog.data.gov.uk/methodology?area=BN1+1ND)
- [ons: advice](https://blog.ons.gov.uk/2024/03/26/local-data-at-your-fingertips/)
- [arts](https://lginform.local.gov.uk/dataAndReports/search/3676?text=arts)
- [local gov](https://lginform.local.gov.uk) (*The Office for Local Government has now closed. This Data Explorer is being maintained and updated by the Ministry of Housing, Communities and Local Government (MHCLG).*)
- [brighton data from oflog](https://oflog.data.gov.uk/planning?area=BN1+1ND)
- [funding](https://reports.esd.org.uk/share/map)
- [expenditure](https://lginform.local.gov.uk/dataAndReports/explorer/6605?text=arts&metricType=6605&area=E10000008%2CAllLaInUK&period=latest)


# links for safe keeping 
**From Adam** 
- [mapping from uprn to geocoordinates](https://www.ordnancesurvey.co.uk/products/os-open-)
- [Planning in Brighton and Hove](https://oflog.data.gov.uk/planning?area=BN1+1ND)
- [Total expenditure on arts, tourism and historic environment](https://lginform.local.gov.uk/dataAndReports/explorer/6605?text=arts&metricType=6605&area=E10000008%2CAllLaInUK&period=latest)
- [LG Inform](https://lginform.local.gov.uk/dataAndReports/explorer) - data here about number of art gallery visits.

**From Fiona**
- [Libraries and makerspaces 2019](https://www.gov.uk/government/publications/libraries-and-makerspaces/libraries-and-makerspaces) - a lot of these places might be closed now. Alas nothing on Brighton, but some useful links.
- [A nesta report on makerspaces from 2015](https://www.nesta.org.uk/report/open-dataset-of-uk-makerspaces-a-users-guide/) unfortunately the dataset, no longer seems to be available.
- [Culture in our city map for Brighton](https://cultureinourcity.com/creative-network/venues-spaces/) - this feels like a work in-progress, not many spaces on here and I know there are more.
- [Resources page with some useful links to reports](https://cultureinourcity.com/creative-network/resources/) 
- [A relevant paper from University of Sussex - Cultural, creative and collective recovery: exploring a creative Worker income Guarantee (CWIG)](https://www.tandfonline.com/doi/full/10.1080/17510694.2023.2301120#abstract)
- [Report: Space to Grow - Brighton & Hove: Space for Culture](https://cultureinourcity.com/resources/space-to-grow-brighton-hove-space-for-culture/)
- [*Meanwhile* space this seemed like a good project](https://www.meanwhilespace.com/about) - still active on companies house, but the website is a bit out of date.
- Some useful links from the 'Creative Lives' website:
-- [Barriers to Banking](https://www.creative-lives.org/barriers-to-banking) - alas no data yet
-- [Report: Spaces for Creative 2024](https://www.creative-lives.org/spaces-for-creativity-2024) - limited data but backs up some of the themes. [Direct link to the PDF](https://www.creative-lives.org/Handlers/Download.ashx?IDMF=0b2f24b3-f2b2-4a5e-b9b6-92c6b4fccdab).
-- [Report: Everyday Creativity 2016](https://www.creative-lives.org/everyday-creativity) - a report from 2016 which includes direct feedback from artists.
-- [Arts Council response to the report 2020](https://www.artscouncil.org.uk/blog/value-everyday-creativity)
