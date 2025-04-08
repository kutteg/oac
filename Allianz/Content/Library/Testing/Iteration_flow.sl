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
