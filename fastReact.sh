[[ -z $1 ]] && { echo "file name not present in arg";exit 1; }

mkdir $1 && cd $1 &&
echo "{\"preset\" : [ \"env\" , \"react\" ]}" > .babelrc.json &&
echo "
<!doctype html>
<html>
<head>
    <meta charset=\"utf-8\"/>
    <meta name=\"viewport\" content=\"width=device-width, initial-width=1.0\">
	<title>React App</title>
</head>
<body>
  <div id=\"app\"></div>
  <script src=\"src/index.js\"></script>
</body>
</html>" > index.html &&
mkdir src && echo "
import React from 'react'
import App from  './App'
import ReactDom from 'react-dom'

ReactDom.render(<App/> , document.getElementById(\"app\"))
" > src/index.js &&
echo "
import React from 'react'
 export default function App(){
     return (
        <h1>Hello world!</h1>   
     )
 }
" > src/App.js &&
npm init -y &&
sed -i -e 's/\("scripts"\:[[:space:]]*{\)/ \1\
"start" : "parcel index.html --open",/' package.json
npm install --save-dev parcel-bundler @babel/preset-env @babel/preset-react &&
npm install react react-dom
rm package.json-e
