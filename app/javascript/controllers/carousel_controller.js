import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("I am connected!")
  }

  prev() {
    const track = document.querySelector('.track');
    const cardWidth = document.querySelector('.card-container').offsetWidth;
    track.style.transform = `translateX(-${cardWidth}px)`;
  }

  next() {
    const track = document.querySelector('.track');
    const cardWidth = document.querySelector('.card-container').offsetWidth;
    track.style.transform = `translateX(${cardWidth}px)`;
    track.style.transform = `translateX(-${carouselWidth}px)`;
  }

}
