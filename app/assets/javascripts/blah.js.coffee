
jQuery ->
    work = -> $.get('/work')
    setTimeout(work, 2000)