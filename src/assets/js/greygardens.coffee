# TODO: make this way better than it currently is lollllz

class @GreyGardens
  @init: ->
    @initEvents()
    @getCopy()
    @getWineByTheGlass()
    @getCider()
    @getRedWineByTheBottle()
    @getWhiteWineByTheBottle()
    @getFood()
    @getHours()

  @initEvents: ->
    $('.nav-home').click (e) ->
      e.preventDefault()
      $('html, body').animate { scrollTop: 0 }, 1000

    $('.nav-wine').click (e) ->
      e.preventDefault()
      $('html, body').animate { scrollTop: $('.wine-bar').offset().top - 200 }, 1000

    $('.nav-food').click (e) ->
      e.preventDefault()
      $('html, body').animate { scrollTop: $('.food').offset().top - 200 }, 1000

    $('.nav-crew').click (e) ->
      e.preventDefault()
      $('html, body').animate { scrollTop: $('.crew').offset().top - 100 }, 1000

  @getCopy: ->
    $.ajax(
      type: "GET",
      url:  "https://the-black-hoof.firebaseio.com/grey_gardens_copydeck.json",
      success: (data) =>
        @populateCopy(data)
    )
  @getHours: ->
    $.ajax(
      type: "GET",
      url:  "https://the-black-hoof.firebaseio.com/grey_gardens_hours.json",
      success: (data) =>
        @populateHours(data)
    )
  @getWineByTheGlass: ->
    $.ajax(
      type: "GET",
      url:  "https://the-black-hoof.firebaseio.com/grey_gardens_wine.json",
      success: (data) =>
        @buildWineByTheGlass(data)
    )
  @getCider: ->
    $.ajax(
      type: "GET",
      url:  "https://the-black-hoof.firebaseio.com/grey_gardens_cider.json",
      success: (data) =>
        @buildCider(data)
    )
  @getFood: ->
    $.ajax(
      type: "GET",
      url:  "https://the-black-hoof.firebaseio.com/grey_gardens_food.json",
      success: (data) =>
        @buildFood(data)
    )
  @getRedWineByTheBottle: ->
    $.ajax(
      type: "GET",
      url:  "https://the-black-hoof.firebaseio.com/grey_gardens_red_wine.json",
      success: (data) =>
        @buildRedWineByTheBottle(data)
    )
  @getWhiteWineByTheBottle: ->
    $.ajax(
      type: "GET",
      url:  "https://the-black-hoof.firebaseio.com/grey_gardens_white_wine.json",
      success: (data) =>
        @buildWhiteWineByTheBottle(data)
    )
  @buildCider: (ciderArr) ->
    $ciderList = $('.cider').find('.menu-content')

    if ciderArr.length
      $.each ciderArr, (i, val) ->
        $ciderList.append('<li>' + val.name + '<br/><span class="description">' + val.description + '</span><span class="price">' + val.price + '</span></li>')

  @buildWineByTheGlass: (wineArr) ->
    $redList = $('.menu-content.red')
    $whiteList = $('.menu-content.white')
    $roseList = $('.menu-content.rose')
    $orangeList = $('.menu-content.orange')
    $sparklingList = $('.menu-content.sparkling')

    redArr = []
    whiteArr = []
    roseArr = []
    orangeArr = []
    sparklingArr = []

    $.each wineArr, (i, val) ->
      category = val.category
      switch category
        when "red"
          redArr.push(wineArr[i])
        when "white"
          whiteArr.push(wineArr[i])
        when "rose"
          roseArr.push(wineArr[i])
        when "orange"
          orangeArr.push(wineArr[i])
        when "sparkling"
          sparklingArr.push(wineArr[i])

    if redArr.length
      $.each redArr, (i, val) ->
        $redList.append('<li>' + val.name + '<br/><span class="description">' + val.description + '</span><span class="price">' + val.price + '</span></li>')
    if whiteArr.length
      $.each whiteArr, (i, val) ->
        $whiteList.append('<li>' + val.name + '<br/><span class="description">' + val.description + '</span><span class="price">' + val.price + '</span></li>')
    if roseArr.length
      $.each roseArr, (i, val) ->
        $roseList.append('<li>' + val.name + '<br/><span class="description">' + val.description + '</span><span class="price">' + val.price + '</span></li>')
    if orangeArr.length
      $.each orangeArr, (i, val) ->
        $orangeList.append('<li>' + val.name + '<br/><span class="description">' + val.description + '</span><span class="price">' + val.price + '</span></li>')
    if sparklingArr.length
      $.each sparklingArr, (i, val) ->
        $sparklingList.append('<li>' + val.name + '<br/><span class="description">' + val.description + '</span><span class="price">' + val.price + '</span></li>')

  @buildRedWineByTheBottle: (wineArr) ->
    $redList = $('.red-wine-by-the-bottle').find('.menu-content')
    categoryArr = []
    uniqueCats = []

    $.each wineArr, (i, val) ->
      category = val.category
      categoryArr.push(category)

    $.each categoryArr, (i, el) ->
      if $.inArray(el, uniqueCats) == -1
        uniqueCats.push el

    $.each uniqueCats, (i, val) ->
      $('<div />', {
        'class': 'red-wine-bottle-' + (i + 1),
        'html': '<h3 class="coral">' + val + '</h3>'
      }).appendTo($redList);
      $.each wineArr, (wineI, el) ->
        if el.category == val
          $('.red-wine-bottle-' + (i + 1)).append('<li>' + el.name + '<br/><span class="description">' + el.description + '</span><span class="price">' + el.price + '</span></li>')

  @buildWhiteWineByTheBottle: (wineArr) ->
    $whiteList = $('.white-wine-by-the-bottle').find('.menu-content')
    categoryArr = []
    uniqueCats = []

    $.each wineArr, (i, val) ->
      category = val.category
      categoryArr.push(category)

    $.each categoryArr, (i, el) ->
      if $.inArray(el, uniqueCats) == -1
        uniqueCats.push el

    $.each uniqueCats, (i, val) ->
      $('<div />', {
        'class': 'white-wine-bottle-' + (i + 1),
        'html': '<h3 class="teal">' + val + '</h3>'
      }).appendTo($whiteList);
      $.each wineArr, (wineI, el) ->
        if el.category == val
          $('.white-wine-bottle-' + (i + 1)).append('<li>' + el.name + '<br/><span class="description">' + el.description + '</span><span class="price">' + el.price + '</span></li>')

  @buildFood: (foodArr) ->
    $foodList1 = $('.food').find('.menu-content-1')
    $foodList2 = $('.food').find('.menu-content-2')
    categoryArr = []
    uniqueCats = []

    $.each foodArr, (i, val) ->
      category = val.category
      categoryArr.push(category)

    $.each categoryArr, (i, el) ->
      if $.inArray(el, uniqueCats) == -1
        uniqueCats.push el

    $.each uniqueCats, (i, val) ->
      $('<div />', {
        'class': 'food-menu-' + (i + 1),
        'html': '<h3 class="teal">' + val + '</h3>'
      }).appendTo($foodList1);
      $('<div />', {
        'class': 'food-menu-' + (i + 1),
        'html': '<h3 class="teal">' + val + '</h3>'
      }).appendTo($foodList2);
      $.each foodArr, (foodI, el) ->
        if el.category == val
          $('.food-menu-' + (i + 1)).append('<li><span class="description">' + el.name + '</span><span class="price">' + el.price + '</span></li>')

    $foodList1.find('.food-menu-1').remove();
    $foodList1.find('.food-menu-4').remove();
    $foodList2.find('.food-menu-2').remove();
    $foodList2.find('.food-menu-3').remove();
    $foodList2.find('.food-menu-5').remove();

  @populateCopy: (copy) ->
    $.each copy, (i, val) ->
      $('.js-copy-' + val.key).html(val.copy)

  @populateHours: (copy) ->
    $.each copy, (i, val) ->
      $('.hours ul').append('<li><span class="day">' + val.day + '</span><span class="time">' + val.hours + '</span></li>')

window.GreyGardens.init()
