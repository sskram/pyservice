# First time setup
```

- python  - select windows 64 bit installer from this link
https://www.python.org/downloads/release/python-3810/

- download and complete the installation. 

 -- example location of interpreter
    C:\Users\3nethra neo\AppData\Local\Programs\Python\Python38

- create virtualenv
    python3 -m venv flaskenv

- activate the new virtualenv
    flaskenv\Scripts\activate.bat

- install packages
    pip install -r requirements.txt

- matlab runtime

https://in.mathworks.com/help/compiler_sdk/ml_code/install-the-matlab-runtime.html

download 2022a
https://in.mathworks.com/products/compiler/matlab-runtime.html

- add to PATH
https://in.mathworks.com/help/compiler_sdk/ml_code/mcr-path-settings-for-run-time-deployment.html
e.g 
C:\Program Files\MATLAB\R2022a\runtime\win64


- setup the library
    cd toplevelfunc\for_redistribution_files_only
    python setup.py install

- serve
    serve.bat

```
## Dev info
```
https://in.mathworks.com/help/compiler_sdk/gs/create-a-python-application-with-matlab-code.html

https://in.mathworks.com/help/compiler_sdk/python/import-compiled-python-packages.html
