namespace: OaC.Qotd
flow:
  name: qotd_install
  workflow:
    - ssh_jumphost_logim:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: git_clone
          - FAILURE: on_failure
    - git_clone:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: azure_login
          - FAILURE: on_failure
    - aks_create:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: acr_register
          - FAILURE: on_failure
    - acr_register:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: image_deploy
          - FAILURE: on_failure
    - image_deploy:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: app_details_get
          - FAILURE: on_failure
    - azure_login:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: aks_create
          - FAILURE: on_failure
    - app_details_get:
        do:
          OaC.Qotd.Mod.ssh_command: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
