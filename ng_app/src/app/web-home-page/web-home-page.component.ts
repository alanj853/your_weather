import { Component, OnInit, Input } from '@angular/core';
import { Store, select } from '@ngrx/store';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-web-home-page',
  templateUrl: './web-home-page.component.html',
  styleUrls: ['./web-home-page.component.css']
})
export class WebHomePageComponent implements OnInit {
  @Input() userLocation: string;

  defaultLocation: string = 'Galway'
  
  ngOnInit() {
    if (!this.userLocation) {
      this.userLocation = this.defaultLocation;
    }
  }
}
