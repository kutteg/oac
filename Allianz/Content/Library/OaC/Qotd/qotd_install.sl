namespace: OaC.Qotd
flow:
  name: qotd_install
  workflow:
    - ssh_jumphost_logim:
        do:
          OaC.Qotd.Mod.ssh_command:
            - command: pwd
        navigate:
          - SUCCESS: git_clone
          - FAILURE: on_failure
    - git_clone:
        do:
          OaC.Qotd.Mod.ssh_command:
            - command: 'git clone https://azureuser:<accesstoken>@github.com/quote-of-the-day/quote-of-the-day.git'
        navigate:
          - SUCCESS: azure_login
          - FAILURE: on_failure
    - aks_create:
        do:
          OaC.Qotd.Mod.ssh_command:
            - command: az aks create --resource-group qotd-RG --name qotd-AKS --node-count 2 --enable-addons monitoring --generate-ssh-keys
        navigate:
          - SUCCESS: acr_register
          - FAILURE: on_failure
    - acr_register:
        do:
          OaC.Qotd.Mod.ssh_command:
            - command: az acr create --resource-group qotd-RG --name qotdacrregistry --sku Basic
        navigate:
          - SUCCESS: image_deploy
          - FAILURE: on_failure
    - image_deploy:
        do:
          OaC.Qotd.Mod.ssh_command:
            - command: kubectl apply -f deployment.yaml
        navigate:
          - SUCCESS: app_details_get
          - FAILURE: on_failure
    - azure_login:
        do:
          OaC.Qotd.Mod.ssh_command:
            - command: 'az login --service-principal -u "APP_ID" -p "PASSWORD" --tenant "TENANT_ID"'
        navigate:
          - SUCCESS: aks_create
          - FAILURE: on_failure
    - app_details_get:
        do:
          OaC.Qotd.Mod.ssh_command:
            - command: kubectl get service quote-of-the-day
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
