import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const prev = document.querySelector('.prev');
    const next = document.querySelector('.next');

    const track = document.querySelector('.track');

    const carouselWidth = document.querySelector('.carousel-container').offsetWidth;

    let index = 0;

    next.addEventListener('click', () => {
      index++;
      prev.classList.add('show');
      track.style.transform = `translateX(-${index * carouselWidth}px)`

      if (track.offsetWidth - (index * carouselWidth) < carouselWidth) {
        next.classList('hide');
      }
    })

    prev.addEventListener('click', () => {
      index --;
      next.classList.remove('hide');
      if (index === 0) {
        prev.classList.remove('show');
      }
      track.style.transform = `translateX(-${index * carouselWidth}px)`
    })
  }

}
