import { Component, OnInit, Input, SimpleChanges } from '@angular/core';
import { WeatherService } from '../_services';

@Component({
  selector: 'app-forecast',
  templateUrl: './forecast.component.html',
  styleUrls: ['./forecast.component.css']
})
export class ForecastComponent implements OnInit {
  @Input() location : string;
  currentWeather: any = <any>{};
  forecast: any = <any>{};
  msg: string;  constructor(private weatherService: WeatherService) {}
  
  ngOnInit() {
    this.searchWeather(this.location);
  }

  ngOnChanges(changes: SimpleChanges): void {
    let newLocation = changes.location.currentValue;
    if (newLocation) {
      this.searchWeather(newLocation);
    }    
  }
  
  searchWeather(loc: string) {
    this.msg = '';
    this.currentWeather = {};
    this.weatherService.getCurrentWeather(loc)
      .subscribe(res => {
        this.currentWeather = res;
      }, err => {}, () => {
        this.searchForecast(loc);
      })
  }
  
  searchForecast(loc: string) {
    this.weatherService.getForecast(loc)
      .subscribe(res => {
        this.forecast = res;
      }, err => {})
  }
  
  resultFound() {
    return Object.keys(this.currentWeather).length > 0;
  }}