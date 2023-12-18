import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  toggleCard() {
    const cards = ['deposit', 'withdrawl', 'transfer'];
    const variable = this.data.get('variable');

    for (const element of cards) {
      const card = document.getElementById(`${element}-card`);
      if (element === variable) {
        if (card.style.display === 'block') {
          card.style.display = 'none';
        } else {
          card.style.display = 'block';
        }    
      } else {
        card.style.display = 'none';
      }
    }
  } 
}