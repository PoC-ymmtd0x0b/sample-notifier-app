import Sortable from 'sortablejs'

document.addEventListener('DOMContentLoaded', () => {
  const element = document.querySelector('#js-sortable')

  if(!element) {
    return null
  }

  Sortable.create(element, {
    handle: '.js-grab',
    onEnd(event) {
      const id = event.item.dataset.practice_id
      const url = `/api/practices/${id}/position`
      const params = { insert_at: event.newIndex + 1 }

      patch(url, params).catch((error) => {
        console.log(error)
      })
    }
  })
})

const getToken = () => {
  const meta = document.querySelector('meta[name="csrf-token"]')
  return meta ? meta.getAttribute('content') : ''
}

const headers = () => {
  return {
    'Content-Type': 'application/json; charset=utf-8',
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-Token': getToken()
  }
}

const patch = (path, params = {}) => {
  return fetch(path, {
    method: 'PATCH',
    headers: headers(),
    credentials: 'same-origin',
    redirect: 'manual',
    body: JSON.stringify(params)
  })
}
