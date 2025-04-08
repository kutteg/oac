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
extensions:
  graph:
    steps:
      counter:
        x: 280
        'y': 160
        navigate:
          d135a2e4-7090-72f2-97fd-1589b049d24c:
            targetId: 49c5c4ae-0267-027d-6d25-ea6d15279e93
            port: NO_MORE
      do_nothing:
        x: 520
        'y': 400
    results:
      SUCCESS:
        49c5c4ae-0267-027d-6d25-ea6d15279e93:
          x: 720
          'y': 160
