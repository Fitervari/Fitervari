import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { WorkoutPlansComponent } from "./workout-plans/workout-plans.component";
import {EquipmentManagementComponent} from "./equipment-management/equipment-management.component";
import {LoginComponent} from "./login/login.component";

const routes: Routes = [
  //{ path: '', pathMatch: 'full', component: LoginComponent },
  { path: "login", component: LoginComponent },
  { path: 'workoutplans', component: WorkoutPlansComponent },
  { path: 'equipment', component: EquipmentManagementComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {

}
