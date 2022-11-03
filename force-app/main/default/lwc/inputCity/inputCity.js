import {LightningElement,track,wire} from 'lwc';

import sendWeather from '@salesforce/apex/WeatherRest.weatherReturn';
import getW from '@salesforce/apex/WeatherRest.getWeather';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {refreshApex} from '@salesforce/apex';

export default class InputCity extends LightningElement {
    searchKey;
    @track weather;
    @track imageURL;

    getCity () {
        sendWeather ({city: this.searchKey})
            .then(()=>{
            })
            .catch(error => console.log(error));
        getW ({city:this.searchKey})
           .then(result => {
               console.log(result);
               this.weather = result;
               this.imageURL = result.Image__c;
           })
           .catch(error=>{
               const event = new ShowToastEvent({
                   title: 'Error',
                   variant: 'error',
                   message: error.body.message,
               });
               console.log (JSON.stringify(this.weather));
               if (this.weather === undefined ) {
                   console.log(JSON.stringify(this.weather));
                   this.dispatchEvent (
                        new ShowToastEvent ({
                            title: 'Error',
                            variant: 'error',
                            message: 'Please enter valid city',
                        })
                   )
               }
           });
    }

    handleChange(event) {
        this.searchKey = event.target.value;
        console.log(this.searchKey);
    }
}