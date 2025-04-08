namespace: Testing
flow:
  name: If_Then_flow
  inputs:
    - verb: xxx
  workflow:
    - schlafen:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${verb}'
            - second_string: schlafen
        navigate:
          - SUCCESS: tue_schlafen
          - FAILURE: essen
    - arbeiten:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${verb}'
            - second_string: arbeiten
        navigate:
          - SUCCESS: tue_arbeiten
          - FAILURE: weiss_nicht
    - essen:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${verb}'
            - second_string: essen
        navigate:
          - SUCCESS: tue_essen
          - FAILURE: arbeiten
    - tue_schlafen:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - tue_essen:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - tue_arbeiten:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - weiss_nicht:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      essen:
        x: 240
        'y': 240
      schlafen:
        x: 80
        'y': 80
      arbeiten:
        x: 400
        'y': 400
      tue_schlafen:
        x: 560
        'y': 80
        navigate:
          5ce7ffb1-e7fc-20c3-a4cf-cb05b9ec12c2:
            targetId: 7ec38f74-bfb7-ddf3-4390-3f63ba664c0e
            port: SUCCESS
      tue_essen:
        x: 560
        'y': 240
        navigate:
          80dccde4-4de4-1983-92fd-1a3cca9f5dba:
            targetId: 7ec38f74-bfb7-ddf3-4390-3f63ba664c0e
            port: SUCCESS
      tue_arbeiten:
        x: 560
        'y': 400
        navigate:
          9b07c8a2-22e6-cf93-7415-1933659ca511:
            targetId: 7ec38f74-bfb7-ddf3-4390-3f63ba664c0e
            port: SUCCESS
      weiss_nicht:
        x: 560
        'y': 560
        navigate:
          cd074ec7-1f17-9951-ad97-329fbdbf440f:
            targetId: 7ec38f74-bfb7-ddf3-4390-3f63ba664c0e
            port: SUCCESS
    results:
      SUCCESS:
        7ec38f74-bfb7-ddf3-4390-3f63ba664c0e:
          x: 840
          'y': 240
