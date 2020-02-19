import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { ApiService } from '../services/api.service';
import { NgForm } from '@angular/forms';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  

  constructor(private toastr: ToastrService, private apiService: ApiService ) {
      
 }

  ngOnInit() {

     
 }

  onSubmit(form) {
   
    if (event) event.preventDefault();
  
    var build = {
        name : form.name,
        email : form.email,
        comment : form.comment,
        location : form.location,
        lifetime : form.lifetime,
        image : form.selected,
        requesttime: Date.now()
    };
   
    console.log('build =====>', build);

    this.apiService.goBuild(build)
    .subscribe(res => {
      console.log(res); 
    }, err => {
      console.log(err);
    });

    console.log('passe data ====> ', build);
    
    this.toastr.success('The deployment request has been submitted successfully', 'Success!');
  }


  /**
   * success, error, info, warning take (message, title, ToastConfig)
   * Example :
   * this.toastr.error('everything is broken', 'Major Error', {
     timeOut: 3000
    });
   */
}
