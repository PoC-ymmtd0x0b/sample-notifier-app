import Sortable from 'sortablejs'

document.addEventListener('DOMContentLoaded', () => {
  const element = document.querySelector('#js-sortable')

  if(!element) {
    return null
  }

  Sortable.create(element, {
    handle: '.js-grab',
    onEnd(event) {
      // const items = event.items.querySelectorAll('.js-grab')
      return true
    }
  })
})
