import { Component, OnInit, Input } from '@angular/core';
import { WeatherService } from '../_services';

@Component({
  selector: 'app-current-weather',
  templateUrl: './current-weather.component.html',
  styleUrls: ['./current-weather.component.css']
})
export class CurrentWeatherComponent implements OnInit {
  @Input() location: string;
  currentWeather: any = <any>{};
  msg: string;
  
  constructor(
    private weatherService: WeatherService
  ) {}
  
  ngOnInit() {
    this.searchWeather(this.location);
  }
  
  searchWeather(loc: string) {
    this.msg = '';
    this.currentWeather = {};
    this.weatherService.getCurrentWeather(loc)
      .subscribe(res => {
        this.currentWeather = res;
      }, err => {
        if (err.error && err.error.message) {
          alert(err.error.message);
          this.msg = err.error.message;
          return;
        }
        alert('Failed to get weather.');
      }, () => {})
  }
  
  resultFound() {
    return Object.keys(this.currentWeather).length > 0;
  }
}