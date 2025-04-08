namespace: Testing
flow:
  name: Iteration_flow
  inputs:
    - list: eins;zwei;drei;vier
  workflow:
    - list_iterator:
        do:
          io.cloudslang.base.lists.list_iterator:
            - list: '${list}'
            - separator: ;
        publish:
          - result_string
        navigate:
          - HAS_MORE: length
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - length:
        do:
          io.cloudslang.base.strings.length:
            - origin_string: '${result_string}'
        navigate:
          - SUCCESS: list_iterator
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      list_iterator:
        x: 280
        'y': 160
        navigate:
          0284433c-950b-d1d8-b5aa-dc124fced299:
            targetId: da0f8052-b822-33e3-2f83-4b2312f2c772
            port: NO_MORE
      length:
        x: 480
        'y': 400
    results:
      SUCCESS:
        da0f8052-b822-33e3-2f83-4b2312f2c772:
          x: 680
          'y': 160
