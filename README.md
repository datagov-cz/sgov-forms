# SGoV Forms

The repository contains model and scripts to generate and manage forms based on [SGoV vocabularies](https://github.com/opendata-mvcr/ssp). The scripts can be executed by SPipes engine either using command-line or web interface. For information to run scripts see [SPipes project](https://kbss.felk.cvut.cz/gitblit/summary/s-pipes.git).

## Main SPipes functions

**transform**  - Transforms SGoV model and data into SForms based record. The record collects data compliant to the model. 
In case a previous version of the record exist, it is merged into the returned record. 
The record is provided by parameters of the service *formGenRepositoryUrl* and *recordGraphId*. 
Parameter *sgovRepositoryUrl* points to SGoV model and related data.   
* *formGenRepositoryUrl* - SPARQL endpoint containing previous versions of a record
* *recordGraphId* - Named graph containing the latest record.
* *sgovRepositoryUrl* - SPARQL endpoint containing SGoV vocabularies. 
 
-----

Tento repozitář je udržován v rámci projektu OPZ č. CZ.03.4.74/0.0/0.0/15_025/0004172.
![Evropská unie - Evropský sociální fond - Operační program Zaměstnanost](https://data.gov.cz/images/ozp_logo_cz.jpg)
