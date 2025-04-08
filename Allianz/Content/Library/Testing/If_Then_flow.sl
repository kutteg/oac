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
