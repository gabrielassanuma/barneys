import { Controller } from "@hotwired/stimulus"

const track = document.querySelector('.track');

const carouselWidth = document.querySelector('.carousel-container').offsetWidth;

export default class extends Controller {
  connect() {
    console.log("I am connected!")
  }

  prev() {
    track.style.transform = `translateX(-${carouselWidth}px)`;
  }

  next() {
    track.style.transform = `translateX(${carouselWidth}px)`;
  }
}
