# 911-firedatas

## Notes:
  * Firehose is not supported in N. Cali.

## MAINTAINER knepperjm@gmail.com

---

## Setup:
[AWS Creds](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

* Install Terraform:
1. [Install Homebrew](https://brew.sh/)
2. [Install Terraform](http://brewformulas.org/Terraform)
3. `brew install python` - this will install pip, or [install pip] (https://pip.pypa.io/en/stable/installing/). 
   * This requires python v2.7.x.
4. `pip install boto`
5. `pip install awscli`

---

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

---

## Writing to stream:
```
./write_to_stream.sh
```

## Reading from stream and writing to firehose, which then writes to s3 bucket specified in your `tk_env` file:
* `python 911-etl.py`

---

## Known Issues:
  * Sometimes due to cleanup you have to rename a bucket or wait for the resource bucket to be competely destroyed in Amazon after re-creating.
    * Workaround - It is better to re-apply then destroy, and re-create in sequential fashion.
  * When in doubt and out of ideas, tear-down (`terraform destroy`), and rename your resources in your `tk_env` file.
