import { Component, OnInit } from '@angular/core';
import { LogisticsService } from '../../services/logistics.service';
import { Shipment, TransportVehicle } from '../../models/logistics.model';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  shipments: Shipment[] = [];
  vehicles: TransportVehicle[] = [];
  totalCargoWeight: number = 0;

  constructor(private logisticsService: LogisticsService) {}

  ngOnInit(): void {
    this.logisticsService.getShipments().subscribe(data => {
      this.shipments = data;
      this.totalCargoWeight = data.reduce((acc, curr) => acc + curr.cargoWeightKg, 0);
    });

    this.logisticsService.getVehicles().subscribe(data => {
      this.vehicles = data;
    });
  }
}
