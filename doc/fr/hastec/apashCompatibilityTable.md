<!-- 
  @todo: styles are not currently surpported by github.
  So fixed header will not work until they authorize it.
  SVG trick does not look to work anymore.
-->
<!--
<style>
  table {
    border-collapse: separate;
    border-spacing: 0;
    border-right: thin solid;
    margin: auto;
  }

  thead {
    position: -webkit-sticky; /* for Safari */
    position: sticky;
    top: 0;
  } 

  td {
    border-left: thin dashed;
  }

  th {
    border-right: thin solid;
  }

  thead th {
    text-align: center;
  }
  
  .start {
    border-left: thin solid;
  }

  /* Dark Mode */
  @media (prefers-color-scheme: dark) {
  thead tr th {
    background-color: black;
    color: white;
    z-index: 1;
    border: thin solid white;
  }

  /* Light Mode */
  @media (prefers-color-scheme: light) {
  thead tr th {
    background-color: #edededff;
    color: black;
  }
</style>
-->

<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

# Compatibility Matrix
Tips: Because css styles are not allowed on github mardowns, it looks not possible
to have a table with fixed header, so let your mouse on a cell to know on which shell it belongs.

<table align='center'>
  <thead>
    <tr>
      <th rowspan="2">Function</th>
      <th colspan='6'><div align='center'>bash</div></th><th colspan='8'><div align='center'>zsh</div></th>
    </tr>
    <tr>
      <th>5.2</th><th>5.1</th><th>5.0</th><th>4.4</th><th>4.3</th><th>4.2</th><th>5.9</th><th>5.8</th><th>5.7</th><th>5.6</th><th>5.5</th><th>5.4</th><th>5.3</th><th>5.2</th>
    </tr>
  </thead>
  <tbody>
      <tr>
      <td>Array.bubbleSort</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>Array.sort</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.add</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.addAll</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.addFirst</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.anythingToEmpty</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.clone</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.concat</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.contains</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.countMatches</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.get</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.getLastIndex</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.getLength</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.getNumberOfElements</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.indexOf</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.indexesOf</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.init</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.initWithValue</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.insert</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.isArray</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.isArrayIndex</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>ArrayUtils.isArrayIndexValid</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.isEmpty</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>ArrayUtils.isNotEmpty</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.isSameLastIndex</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.isSameLength</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.isSorted</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.join</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.lastIndexOf</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.nullToEmpty</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.remove</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.removeAll</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.removeAllOccurrences</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.removeDuplicates</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.removeElement</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.removeElements</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.reverse</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.shift</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.shuffle</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.subarray</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.swap</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>ArrayUtils.toArray</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>BashUtils.getFunctionName</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>BashUtils.getParentFunctionName</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>BashUtils.isDeclared</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>BashUtils.isVariable</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>BashUtils.isVariableNameValid</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.addDays</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.addHours</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.addMinutes</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.addMonths</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.addSeconds</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.addWeeks</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.addYears</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>DateUtils.isDate</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.debug</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.error</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.ex</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.fatal</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.in</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.info</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.message</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.out</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.trace</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Log.warn</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>MapUtils.clone</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MapUtils.containsKey</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MapUtils.getKeys</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MapUtils.init</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MapUtils.isMap</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>Math.abs</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Math.max</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Math.min</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>MatrixUtils.create</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.get</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.getDim</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.getDimLastIndex</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.getDimOffset</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.getIndex</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.isMatrix</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.set</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>MatrixUtils.setDim</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >❌</td>
    </tr>
    <tr>
      <td>NumberUtils.compare</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>NumberUtils.isDigits</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>NumberUtils.isInteger</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>NumberUtils.isLong</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>NumberUtils.isLongPositive</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>NumberUtils.isParsable</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>NumberUtils.max</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>NumberUtils.min</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>Random.nextInt</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.abbreviate</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.containsOnly</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.countMatches</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.endsWith</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.equals</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.indexOf</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.indexOfAny</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.isAlpha</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.isAnyEmpty</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.isBlank</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.isEmpty</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.leftPad</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.lowerCase</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.remove</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.repeat</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.replace</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.reverse</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.rightPad</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.rotate</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.split</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.splitAny</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.splitPreserveAllTokens</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.startsWith</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.substring</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.trim</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >✅</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>StringUtils.upperCase</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>VersionUtils.compare</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    <tr>
      <td>VersionUtils.isLowerOrEquals</td>
      <td title='bash 5.2' >✅</td>
      <td title='bash 5.1' >✅</td>
      <td title='bash 5.0' >✅</td>
      <td title='bash 4.4' >✅</td>
      <td title='bash 4.3' >✅</td>
      <td title='bash 4.2' >❌</td>
      <td title='zsh 5.9' >✅</td>
      <td title='zsh 5.8' >✅</td>
      <td title='zsh 5.7' >✅</td>
      <td title='zsh 5.6' >✅</td>
      <td title='zsh 5.5' >✅</td>
      <td title='zsh 5.4' >✅</td>
      <td title='zsh 5.3' >✅</td>
      <td title='zsh 5.2' >✅</td>
    </tr>
    
  </tbody>
</table>

<div align='center'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>
