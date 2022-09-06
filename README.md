- use `solc-select` to switch between different compiler versions
for example:
```
solc-select use 0.7.0
```

- run Echidna (in project roor):
in `property` testing mode:
```
echidna-test test/echidna --contract TokenTest --config echidna.yaml
```
in `assertion` testing mode:
```
echidna-test test/echidna --contract TokenTest --config echidna.yaml --test-mode assertion
```
in `dapptest` testing mode:
```
echidna-test test/echidna --contract TokenTest --config echidna.yaml --test-mode dapptest
```