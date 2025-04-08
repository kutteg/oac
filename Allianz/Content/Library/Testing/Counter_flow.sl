namespace: Testing
flow:
  name: Counter_flow
  inputs:
    - start: '1'
    - end: '4'
  workflow:
    - counter:
        do:
          io.cloudslang.base.utils.counter:
            - from: '${start}'
            - to: '${end}'
            - increment_by: '1'
        publish:
          - result: '${return_result}'
        navigate:
          - HAS_MORE: do_nothing
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing:
            - input_0: '${result}'
        publish: []
        navigate:
          - SUCCESS: counter
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
