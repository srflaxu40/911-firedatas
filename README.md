# 911-firedatas

## Notes:
* Firehose is not supported in N. Cali.
* MAINTAINER knepperjm@gmail.com

---

## Setup:
* [AWS Creds](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
* Install Terraform (latest from brew):
1. [Install Homebrew](https://brew.sh/)
2. [Install Terraform](http://brewformulas.org/Terraform)
3. `brew install python` - this will install pip, or [install pip] (https://pip.pypa.io/en/stable/installing/). 
   * This requires python v2.7.x.
4. `pip install boto`
5. `pip install awscli`


## Run:

 Source the Terraform Environment File:
  `source tk_env`

* Init a new Terraform working directory:
  `terraform init`

* Get modules:
  `terraform get`

* Create Terraform Plan:
  `terraform plan`

* Create Infrastructure:
  `terraform apply`

* Cleanup:
  `terraform destroy`



## Writing / Reading to stream:

* `./write_to_stream.sh`

* While this writes to the kinesis stream, run the below python script to consume, and then put records into your firehose delivery stream:

* `python 911-etl.py`


## Known Issues:
  * Sometimes due to cleanup you have to rename a bucket or wait for the resource bucket to be competely destroyed in Amazon after re-creating.
    * Workaround - It is better to re-apply then destroy, and re-create in sequential fashion.
  * When in doubt and out of ideas, tear-down (`terraform destroy`), and rename your resources in your `tk_env` file.
