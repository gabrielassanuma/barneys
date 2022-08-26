import { Controller } from "@hotwired/stimulus"

<<<<<<< HEAD
=======
const track = document.querySelector('.track');

const carouselWidth = document.querySelector('.carousel-container').offsetWidth;

>>>>>>> 33345f942c40825a57483263102cfb81bf038496
export default class extends Controller {

  connect() {
    console.log("I am connected!")
  }

  prev() {
<<<<<<< HEAD
    const track = document.querySelector('.track');
    const cardWidth = document.querySelector('.card-container').offsetWidth;
    track.style.transform = `translateX(-${cardWidth}px)`;
  }

  next() {
    const track = document.querySelector('.track');
    const cardWidth = document.querySelector('.card-container').offsetWidth;
    track.style.transform = `translateX(${cardWidth}px)`;
=======
    track.style.transform = `translateX(-${carouselWidth}px)`;
  }

  next() {
    track.style.transform = `translateX(${carouselWidth}px)`;
>>>>>>> 33345f942c40825a57483263102cfb81bf038496
  }
}
