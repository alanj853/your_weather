import { Component, OnInit, Input } from '@angular/core';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-web-home-page',
  templateUrl: './web-home-page.component.html',
  styleUrls: ['./web-home-page.component.css']
})
export class WebHomePageComponent implements OnInit {
  @Input() userLocation: string;
  formLoc :string;

  defaultLocation: string = 'Galway'
  
  ngOnInit() {
    if (!this.userLocation) {
      this.userLocation = this.defaultLocation;
    }
  }

  search(searchForm: NgForm) {
    if (searchForm.invalid) {
      return;
    }
    this.userLocation = this.formLoc;
  }
}
