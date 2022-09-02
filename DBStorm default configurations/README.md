# Default Configurations

DBStorm needs six configurations, which should be placed in the same folder, such as `./BlindW-R`. The configurations and the corresponding content are as follows:

- analysis.yml: the configuration of Analysis Module.
- c3p0.xml: database information, which describes the database instance used by DBStorm.
- data_generation.yml: the configuration of data generation, which describe the range of data.
- format.xml: the configuration of data type, which describe the length or size of data generated.
- loader.yml: the configuration of loader, which describe how to load workload.
- operation.xml: the configuration of txn generation, which describe the txn template.
- schema.xml: the configuration of schema generation, which describe the schema of the workload. 

Though there are many configurations, **most of them** generally have no need to be modified. Those more importance configurations are as below:

1. loader.yml:
   1. numberOfLoader: the number of loader thread.
   2. execCountPerLoader: number of txns executed by EACH thread.
2. operation.xml:
   1. operation_number: number of operations in a txn.
   2. operation_type: type of operation.
3. schema.xml:
   1. table/number_of _record: the number of row in a table.

Because DBStorm's configurations have a high degree of freedom, different configurations also have a significant impact on code coverage. We provide the configurations used in our experiment in `./default configuration/pg-*`. And  the code coverage summary of each kind of configuration. Because the workload is randomly generated every time, so the code coverage may have some little deviations with the figure shown in paper.

## Database Configuration

We use postgresql 12.7 in the experiment. To enable some features of PG, the configuration of PG is modified, as the postgresql.conf shown, which has slightly influence on other benchmark's code coverage.

## Configuration Overview

To improve the code coverage, we use different kinds of configurations, and take the configurations confuse on the same aspect into a kind folder, such as :

- pg-2pc: workloads with two-parse commit.
- pg-normal: common workloads.
- pg-check: workloads with sub-transaction, i.e. checkpoint. 
- pg-index: workloads contain ALTER INDEX
- pg-logi: workloads with logical replication, see [PostgreSQL: Documentation: 12: Chapter 30. Logical Replication](https://www.postgresql.org/docs/12/logical-replication.html). To use the configurations in this folder, please ensure that there are two PG database instances which support this feature, and their information correspond to the configuration of DBStormdb0,DBStormdb1 in c3p0.xml.
- pg-serial: workloads load serially. 
- pg-table-lock: workloads contain table-level lock.

The configuration folder in a kind folder are named as number+'w'.

## Coverage summary

In the end, We calculate the code coverage summary of each kind folder's configurations placing in `./default configuration/result/`