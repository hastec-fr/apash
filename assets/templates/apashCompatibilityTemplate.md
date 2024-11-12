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
      ${APASH_SHELL_NAMES}
    </tr>
    <tr>
      ${APASH_SHELL_VERSIONS}
    </tr>
  </thead>
  <tbody>
      ${APASH_FUNCTION_RESULTS}
  </tbody>
</table>

<div align='center'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>
