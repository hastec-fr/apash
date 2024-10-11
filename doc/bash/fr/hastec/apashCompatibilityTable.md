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

<div align='center' id='apash-top'>
  <a href='https://github.com/hastec-fr/apash'>
    <img alt='apash-logo' src='../../../../assets/apash-logo.svg'/>
  </a>

  # Apash
</div>

<table>
  <thead>
    <tr>
      <th rowspan="2">Function</th>
      <th colspan='8'>bash</th>
    </tr>
    <tr>
      <th>5.2</th><th>5.1</th><th>5.0</th><th>4.4</th><th>4.3</th><th>4.2</th><th>4.1</th><th>4.0</th>
    </tr>
  </thead>
  <tbody>
      <tr><th class='start'>Array.sort</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.add</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.addAll</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.addFirst</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.anythingToEmpty</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.clone</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.contains</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.get</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.getLastIndex</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.getLength</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.indexOf</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.indexesOf</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.init</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.insert</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.isArray</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>ArrayUtils.isArrayIndex</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>ArrayUtils.isArrayIndexValid</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.isEmpty</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.isNotEmpty</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.isSameLastIndex</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.isSameLength</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.isSorted</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.lastIndexOf</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.nullToEmpty</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.remove</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.removeAll</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.removeAllOccurrences</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.removeDuplicates</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>ArrayUtils.removeElement</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.removeElements</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.reverse</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.shift</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.shuffle</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.subarray</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.swap</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>ArrayUtils.toArray</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>BashUtils.isDeclared</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>BashUtils.isVariable</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>BashUtils.isVariableNameValid</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>DateUtils.addDays</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>DateUtils.addHours</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>DateUtils.addMinutes</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>DateUtils.addMonths</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>DateUtils.addSeconds</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>DateUtils.addWeeks</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>DateUtils.addYears</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>DateUtils.isDate</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>MapUtils.containsKey</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>MapUtils.isMap</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>Math.abs</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>Math.max</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>Math.min</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.compare</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.isDigits</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.isInteger</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.isLong</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.isLongPositive</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.isParsable</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.max</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>NumberUtils.min</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>Random.nextInt</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.abbreviate</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.containsOnly</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.countMatches</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.endsWith</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.equals</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.indexOf</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.indexOfAny</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>StringUtils.isAlpha</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.isAnyEmpty</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.isBlank</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.isEmpty</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.lowerCase</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>StringUtils.remove</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.repeat</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.replace</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>StringUtils.reverse</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.rotate</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.split</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>StringUtils.splitPreserveAllTokens</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr><tr><th class='start'>StringUtils.startsWith</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.substring</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.trim</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th></tr><tr><th class='start'>StringUtils.upperCase</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>✅</th><th>❌</th><th>❌</th><th>❌</th></tr>
  </tbody>
</table>

<div align='center'>[ <a href='#apash-top'>↑ Back to top ↑</a> ]</div>
