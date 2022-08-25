import { Controller } from "@hotwired/stimulus"

const track = document.querySelector('.track');

const cardWidth = document.querySelector('.card-container').offsetWidth;

export default class extends Controller {
  connect() {
    console.log("I am connected!")
  }

  prev() {
    track.style.transform = `translateX(-${cardWidth}px)`;
  }

  next() {
    track.style.transform = `translateX(${cardWidth}px)`;
  }
}
