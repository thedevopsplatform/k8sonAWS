# Kubernetes Deployed on AWS using Ansible

1. Clone the Repo

2. Run
    ```
    vagrant up
    vagrant ssh
    ```

3. Run inside vagrant vm;
    ```
    pip install boto boto3 botocore  --upgrade
    pip install awscli --upgrade --user
    ```

4. AWS Configure
   ```aws configure```
    and enter your IAM cred and region

5. Move into vagrant directory 
   ```
   cd /vagrant/
   ```

6. Add your public ip to all.yml file inside group_vars folder

7. Run ansible playbook;
    ```
    ansible-playbook main.yml
    ```

8. Thats it your k8s cluster is ready

